# 在 Debian 13 下测试通过。

# --- 路径配置 ---
# 游戏根目录
GAME_ROOT ?= $(HOME)/.steam/steam/steamapps/common/Chill with You Lo-Fi Story

.PHONY: all build clean check-path install-deps

all: build

install-deps:
	sudo apt install make dotnet-sdk-8.0

check-path:
	@if [ ! -d "$(GAME_ROOT)" ]; then \
		echo "错误: 找不到游戏目录:"; \
		echo "  $(GAME_ROOT)"; \
		echo "你可以通过命令指定路径: make GAME_ROOT='/your/custom/path'"; \
		exit 1; \
	fi
	@if [ ! -d "$(GAME_ROOT)/Chill With You_Data/Managed" ]; then \
		echo "错误: 找不到 Managed 目录:"; \
		echo "  $(GAME_ROOT)/Chill With You_Data/Managed"; \
		echo "你可能需要验证游戏文件完整性或重装游戏"; \
		exit 1; \
	fi
	@echo "已找到游戏路径: $(GAME_ROOT)"

build: check-path
	dotnet build -c Release

clean:
	rm -rf AIChat/bin/ AIChat/obj/
	rm -f extra.targets
