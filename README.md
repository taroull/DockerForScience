# DockerForScience
>  **Deploying a Scalable Data Science Environment Using Docker** <br>
> by Martín-Santana, S., Pérez-González, C.J., Colebrook, M., Roda-García, J.L., González-Yanes, P. <br>
> In: García Márquez, F., Lev, B. (eds) *Data Science and Digital Business*. Springer, Cham. <br>
> [https://doi.org/10.1007/978-3-319-95651-0_7](https://doi.org/10.1007/978-3-319-95651-0_7)

 
| **Located in**        | **File name**              | **Function**                                                       |
|-----------------------|----------------------------|--------------------------------------------------------------------|
| **/**                 | build_image.bat            | Builds the container image in Windows                              |
|                       | build_image.sh             | Builds the container image in Ubuntu or Mac                        |
| **install/**          | base.sh                    | Installs base system libraries and applications                    |
|                       | custom_python.sh	         | Allows installing certain versions of additional python libraries  |
|                       | jupyter.sh	               | Installs Jupyter notebook and languages’ kernels                   |
|                       | jupyter_notebook_config.py | Jupyter notebook configuration file                                |
|                       | PyLibraries.sh             | Basic Python libraries                                             |
|                       | python.sh                  | Installs versions 2.7 and 3.6 of Python                            |
|                       | R.sh                       | Installs the R programming language                                |
|                       | Rconfig.R                  | Installs the R kernel in Jupyter                                   |
|                       | RStudio.sh                 | Installs the RStudio IDE                                           |
|                       | spark.sh                   | Installs Spark                                                     |
|                       | SparkConf.sh               | Spark configuration file                                           |
|                       | start.sh                   | Entry point in Dockerfile: runs the container                      |
| **Start/Ubuntu_Mac/** | Docker_install.sh	         | Installs Docker in Ubuntu or Mac                                   |
|                       | execute_worker.sh          | Deploys one Spark worker node                                      |
|                       | start_master.sh            | Starts the Spark master                                            |
|                       | start_workers.sh           | Deploys additional worker nodes for Spark                          |
| **Start/Windows/**    | runworker.bat              | Deploys one Spark worker node                                      |
|                       | start_master.bat	         | Starts the Spark master                                            |
|                       | start_workers.bat          | Deploys additional worker nodes for Spark                          |
