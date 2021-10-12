env_name="SOMENAME_env"
py_version=3.7
tf_version=2.4.1

# Prepare Anaconda
tar -xvzf /home/$USER/medad/cudnn-10.1-linux-x64-v7.6.5.32.tgz
sudo cp cuda/include/cudnn.h /usr/lib/cuda/include/
sudo cp cuda/lib64/libcudnn* /usr/lib/cuda/lib64/
sudo chmod a+r /usr/lib/cuda/include/cudnn.h /usr/lib/cuda/lib64/libcudnn*
echo 'export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
chmod +x Anaconda3-2020.11-Linux-x86_64.sh
./Anaconda3-2020.11-Linux-x86_64.sh

export PATH="/home/$USER/anaconda3/bin:$PATH"
cd /home/$USER/anaconda3/bin
./conda init bash
source ~/.bashrc

# Create the Evironment
conda create -y --name $env_name
conda activate $env_name

# prepare prequisites
conda install -y -c anaconda python=$py_version
conda install -y pip
conda install -y -c conda-forge jupyterlab

# TF and Torch packages
conda install -y pytorch torchvision torchaudio -c pytorch -c conda-forge
conda install -y tensorflow-gpu=$tf_version -c anaconda

# Computer Vision/Graphics
pip install opencv-python
pip install imageio

# Production level
pip install tf2onnx onnx onnxruntime
