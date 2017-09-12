using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

[ExecuteInEditMode]
public class RenderCameraEffect : MonoBehaviour {

	//public Material mat;
    public Shader m_shader;
    public Camera m_camera;
    public Material m_material;

    // Use this for initialization
    void Start () {
        Assert.IsNotNull(m_camera);
        Assert.IsNotNull(m_material);
        Assert.IsNotNull(m_shader);

        m_camera.SetReplacementShader(m_shader, "RenderType");
    }

    // Update is called once per frame
    void Update () {
		
	}

	//void OnRenderImage(RenderTexture src, RenderTexture dest) {
 //       Assert.IsNotNull(m_camera);
 //       //m_camera.depthTextureMode = DepthTextureMode.Depth;
 //       m_camera.RenderWithShader(m_shader, "RenderType");
 //       //Graphics.Blit(src, dest);//, m_material);
	//}

    private void OnPreRender()
    {
        //var cam = GetComponent<Camera>();
        //cam.cullingMask = 1 << 8;
    }

    private void OnRenderObject()
    {

        //cam.Render();
    }

    private void OnPostRender()
    {
        //var cam = GetComponent<Camera>();
        //cam.cullingMask = 1 << LayerMask.NameToLayer("Hover Effect");
        //cam.clearFlags = CameraClearFlags.Depth;
        //cam.RenderWithShader(EffectShader, replacementTag);
        //cam.cullingMask = ~0;
        //cam.clearFlags = CameraClearFlags.Skybox;

    }
}
