
Texture2D tex2D;


matrix World;
matrix View;
matrix Projection;

//Menu structs

struct VSSceneIn
{
	float4 Pos	: POS;
	float2 Tex : TEXCOORD;
	float3 n : NORMAL;
};

struct PSSceneIn
{
	float4 Pos  : SV_Position;
	float2 Tex : TEXC;
};

//-----------------------------------------------------------------------------------------
// Constant Buffers (where we store variables by frequency of update)
//-----------------------------------------------------------------------------------------
cbuffer cbEveryFrame
{
};

//-----------------------------------------------------------------------------------------
// State Structures
//-----------------------------------------------------------------------------------------
DepthStencilState DisableDepth
{
    DepthEnable = FALSE;
    DepthWriteMask = ZERO;
};

DepthStencilState EnableDepthTestOnly
{
    DepthEnable = TRUE;
    DepthWriteMask = ZERO;
};

DepthStencilState EnableDepth
{
    DepthEnable = TRUE;
    DepthWriteMask = ALL;
};

RasterizerState NoCulling
{
	CullMode = NONE;
};

SamplerState linearSampler
{
	Filter = MIN_MAG_MIP_LINEAR;
	AddressU = Clamp;
    AddressV = Clamp;
    MaxAnisotropy = 16;
};

BlendState SrcAlphaBlending
{
	BlendEnable[0] = TRUE;
	SrcBlend = SRC_ALPHA;
	DestBlend = INV_SRC_ALPHA;
	BlendOp = ADD;
	SrcBlendAlpha = ZERO;
	DestBlendAlpha = ZERO;
	BlendOpAlpha = ADD;
	RenderTargetWriteMask[0] = 0x0F;
};


//-----------------------------------------------------------------------------------------
// VertexShader: VSScene
//-----------------------------------------------------------------------------------------
PSSceneIn VSScene(VSSceneIn input)
{
	PSSceneIn output;
	
		input.Pos = mul( input.Pos, World );
	    output.Pos = mul( input.Pos, View );
	    output.Pos = mul( output.Pos, Projection );

		output.Tex = input.Tex;
		
	return output;
}

//-----------------------------------------------------------------------------------------
// PixelShader: PSSceneMain
//-----------------------------------------------------------------------------------------


float4 textured( PSSceneIn input ) : SV_Target
{
	return tex2D.Sample( linearSampler, input.Tex );
}


//-----------------------------------------------------------------------------------------
// Technique: RenderTextured  
//-----------------------------------------------------------------------------------------
technique10 DrawTech
{
    pass p0
    {
		// Set VS, GS, and PS
        SetVertexShader( CompileShader( vs_4_0, VSScene() ) );
        SetGeometryShader( NULL );
        SetPixelShader( CompileShader( ps_4_0, textured() ) );
	    
	    SetRasterizerState( NoCulling );

	    SetDepthStencilState( EnableDepth, 0 );
	    //SetDepthStencilState( DisableDepth, 0 );
	    //SetDepthStencilState( EnableDepthTestOnly, 0 );
    }  
}
