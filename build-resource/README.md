# Build Resources

## Unity Assembly References

Unity Engine assembly references (UnityEngine.dll and UnityEngine.*.dll modules) are obtained from NuGet during the build process to avoid copyright concerns.

### Downloaded from NuGet (during CI build):
- UnityEngine.dll
- UnityEngine.CoreModule.dll
- UnityEngine.AnimationModule.dll
- UnityEngine.AudioModule.dll
- UnityEngine.IMGUIModule.dll
- UnityEngine.InputLegacyModule.dll
- UnityEngine.TextRenderingModule.dll
- UnityEngine.UIModule.dll
- UnityEngine.UnityWebRequestModule.dll
- UnityEngine.UnityWebRequestAudioModule.dll

These are downloaded from the `UnityEngine.Modules` NuGet package (version 2021.3.33) in the CI workflow.

### Kept in repository:
- UnityEngine.UI.dll

**Why is UnityEngine.UI.dll kept?**
UnityEngine.UI.dll is not available as a NuGet package. It is part of Unity's UI Toolkit (UGUI) which is open source and licensed under the Unity Companion License. This license allows redistribution as part of Unity-based applications and games. Since this DLL is required for compilation and cannot be easily obtained from NuGet, it is kept in the repository.

## Local Development

When building locally, you can either:
1. Run the same download process as CI (see `.github/workflows/build.yml`)
2. Copy Unity DLLs from your game installation to `build-resource/buildenv/mokgamedir/Chill With You_Data/Managed/`

The CI workflow automatically downloads these files before building, so no manual intervention is needed for automated builds.
