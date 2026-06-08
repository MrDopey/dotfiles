# These are injected into the .zshrc file
export ZOOM_TOKEN=

export DEV_CONTAINER_USER_ID=$(id -u)
export DEV_CONTAINER_GROUP_ID=$(id -g)

# export LOGSEQ_DEV_NOTES_DIR=/mnt/c/Sandbox/
# export LOGSEQ_DEV_NOTES_DIR=~/sandbox/

# API keys as required
# https://pi.dev/docs/latest/providers
export CLOUDFLARE_API_KEY=
export CLOUDFLARE_ACCOUNT_ID=
# https://api.cloudflare.com/client/v4/accounts/{account_id}/ai/run
# model id: @cf/moonshotai/kimi-k2.6
# all model list: https://developers.cloudflare.com/workers-ai/models/
# expires: 

export GEMINI_API_KEY=
# https://generativelanguage.googleapis.com/v1beta
# model id: gemini-2-5-flash-lite
# expires: can't set

export GROQ_API_KEY=
# https://api.groq.com/openai/v1
# model id: qwen/qwen3-32b
# all model list: https://console.groq.com/docs/models
# expires: 

export MISTRAL_API_KEY=
# https://api.mistral.ai/v1
# model id: mistral/codestral-latest
# all model list: https://docs.mistral.ai/models/overview
# all model limits https://admin.mistral.ai/plateforme/limits
# expires: 

export NVIDIA_API_KEY=
# https://integrate.api.nvidia.com/v1
# expires: 

export OPENCODE_API_KEY=
# https://opencode.ai/zen/v1
# model id: opencode/big-pickle
# all model list: https://opencode.ai/docs/zen#endpoints
# expires: can't set

export OPENROUTER_API_KEY=
# https://openrouter.ai/api/v1
# mode id: openrouter/free
# all model list: https://openrouter.ai/models?q=%28free%29
# or explicit model with free tag
# openrouter/nvidia/nemotron-nano-9b-v2:free
# expires: 
