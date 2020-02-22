FROM jupyter/datascience-notebook

USER root

RUN pip install jupyter_contrib_nbextensions \
    && jupyter contrib nbextension install --system \
    && pip install jupyter_nbextensions_configurator \
    && jupyter nbextensions_configurator enable --system \
    && pip install yapf # for code pretty

USER $NB_UID

CMD /bin/bash -c "/opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='0.0.0.0' --port=8888 --no-browser --NotebookApp.token=''"