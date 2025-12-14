# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail x-flux-comfyui
RUN comfy node install --exit-on-fail comfyui-gguf@1.1.9

# download models into comfyui
RUN comfy model download --url https://huggingface.co/XLabs-AI/flux-controlnet-collections/resolve/main/flux-hed-controlnet-v3.safetensors --relative-path models/checkpoints --filename flux-hed-controlnet-v3.safetensors
RUN comfy model download --url https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors --relative-path models/vae --filename ae.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/stable-diffusion-3.5-fp8/resolve/main/text_encoders/clip_l.safetensors --relative-path models/clip --filename clip_l.safetensors
RUN comfy model download --url https://huggingface.co/city96/t5-v1_1-xxl-encoder-gguf/resolve/main/t5-v1_1-xxl-encoder-Q6_K.gguf --relative-path models/clip --filename t5-v1_1-xxl-encoder-Q6_K.gguf
RUN comfy model download --url https://huggingface.co/city96/FLUX.1-dev-gguf/resolve/main/flux1-dev-Q4_K_S.gguf --relative-path models/diffusion_models --filename flux1-dev-Q4_K_S.gguf
RUN comfy model download --url https://huggingface.co/camenduru/FLUX.1-dev/resolve/main/flux_realism_lora.safetensors --relative-path models/loras --filename flux_realism_lora.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
