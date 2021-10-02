env_name="*_env"
py_version=3.7
tf_version=2.4.1

conda create -y --name $env_name
conda activate $env_name

# prepare prequisites
conda install -y -c anaconda python=$py_version
conda install -y pip
conda install -y -c conda-forge jupyterlab

# required packages
conda install pytorch torchvision torchaudio -c pytorch -c conda-forge
conda install -y tensorflow-gpu=$tf_version -c anaconda
pip install opencv-python