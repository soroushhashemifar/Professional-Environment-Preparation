env_name="SOMENAME_env"
py_version=3.7
tf_version=2.4.1

conda create -y --name $env_name
conda activate $env_name

# prepare prequisites
conda install -y -c anaconda python=$py_version
conda install -y pip
conda install -y -c conda-forge jupyterlab

# TF and Torch packages
conda install pytorch torchvision torchaudio -c pytorch -c conda-forge
conda install -y tensorflow-gpu=$tf_version -c anaconda

# Computer Vision/Graphics
pip install opencv-python
pip install imageio

# Production level
pip install tf2onnx onnx onnxruntime
