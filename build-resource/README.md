这里存放构建 Mod 需要用到的资源文件，主要用于在线构建（本地构建可直接引用游戏所在目录）。

## 文件说明
- `buildenv` 中的文件用于构建 `AIChat.dll`（随后将其放入 `assets` 中进行打包）。
  - `mokgamedir` 与游戏目录结构保持一致，但仅保留构建所需的部分（参见 [qzrs777/AIChat 仓库中的 AIChat/AIChat.csproj](https://github.com/qzrs777/AIChat/blob/main/AIChat/AIChat.csproj) 所引用的文件）来减小体积（注：`BepInEx` 采用软链接，不需要移除其中的任何文件）。
- `assets` 中的文件用于直接打包。

## Unity 引擎程序集引用

为避免版权风险，Unity 引擎的程序集引用（UnityEngine.dll 及 UnityEngine.*.dll 模块）现在从 NuGet 包获取，而不是存储在仓库中。

### 从 NuGet 下载（CI 构建时）：
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

这些文件在 CI 工作流中从 `UnityEngine.Modules` NuGet 包（版本 2021.3.33）下载。

### 保留在仓库中：
- UnityEngine.UI.dll

**为什么保留 UnityEngine.UI.dll？**

UnityEngine.UI.dll 在 NuGet 上不可用。它是 Unity UI 工具包（UGUI）的一部分，该工具包是开源的，采用 Unity Companion License 授权。该许可证允许作为基于 Unity 的应用程序和游戏的一部分进行再分发。由于编译需要此 DLL 且无法从 NuGet 轻松获取，因此将其保留在仓库中。

## 本地开发

本地构建时，您可以：
1. 运行与 CI 相同的下载流程（参见 `.github/workflows/build.yml`）
2. 从游戏安装目录复制 Unity DLL 到 `build-resource/buildenv/mokgamedir/Chill With You_Data/Managed/`

CI 工作流会在构建前自动下载这些文件，因此自动构建无需手动干预。
