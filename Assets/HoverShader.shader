Shader "Custom/HoverShader" {
	Properties {
		_Color ("Color", Color) = (1,0,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader {
			//Pass {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		//Pass {
			//Blend one one
			//Cull Off
			//ZWrite Off
			//ZTest Always
		//}
			//}

			CGPROGRAM

			// Physically based Standard lighting model, and enable shadows on all light types
			#pragma surface surf Standard fullforwardshadows

			// Use shader model 3.0 target, to get nicer looking lighting
			#pragma target 3.0

			sampler2D _MainTex;

			//sampler2D _CameraDepthTexture;

			struct Input {
				float2 uv_MainTex;
				float4 screenPos;
				float3 worldPos;
			};

			half _Glossiness;
			half _Metallic;
			fixed4 _Color;

			// Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
			// See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
			// #pragma instancing_options assumeuniformscaling
			UNITY_INSTANCING_CBUFFER_START(Props)
				// put more per-instance properties here
			UNITY_INSTANCING_CBUFFER_END

			void surf(Input IN, inout SurfaceOutputStandard o) {
				// Albedo comes from a texture tinted by color
				fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
				//half d = tex2D(_CameraDepthTexture, IN.uv_MainTex).x;
				o.Albedo = c.rgb;
				//half4 cpos = ComputeScreenPos(half4(IN.worldPos, 0));
				float4 spos = IN.screenPos;
				spos.xy /= spos.w;
				//float4 suv = spos;
				//suv.xy /= suv.w;
				//half4 suv = cpos;
				//o.Albedo.r += abs(suv.x);
				half stripes = frac((spos.x + spos.y + _Time.x) * 4);
				o.Albedo.rgb += stripes * .05;
				//o.Albedo.rg = stripes;
				//o.Albedo.b = 0;
				// Metallic and smoothness come from slider variables
				o.Metallic = _Metallic;
				o.Smoothness = _Glossiness;
				o.Alpha = 0;
			}

			ENDCG
		//} // End Pass
	}

	FallBack "Diffuse"
}
