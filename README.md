# dev-python-tensorflow-docker
An example repository for python development in GPU and CPU environment

## Features
- Easy building and running by `make` commands.
- Managing packages by [poetry](https://github.com/sdispater/poetry)<sup class="footnote-ref"><a href="#fn1" id="fnref1">[1]</a></sup>
- Linting and testing by Circle CI

## Requirements
- [Docker](https://www.docker.com/) >= 19.03
- [GNU Make](https://www.gnu.org/software/make/)
- [nvidia-drivers](https://github.com/NVIDIA/nvidia-docker/wiki/Frequently-Asked-Questions#how-do-i-install-the-nvidia-driver) (Only for GPU)
- [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) (Only for GPU)

## Installation
### Clone repository
```bash
$ git clone https://github.com/hiro-o918/dev-python-tensorflow-docker
$ cd dev-python-tensorflow-docker
```

### Build image
```bash
$ make build
```

**NOTE:** <br> 
If you want use GPUs, install [nvidia-drivers](https://github.com/NVIDIA/nvidia-docker/wiki/Frequently-Asked-Questions#how-do-i-install-the-nvidia-driver) and [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) first.


## How to Use
### Train mnist (example source)
```bash
$ make bash
$ python src/train_mnist.py
```
### Run python
```bash
$ make run
```

### Run bash
```bash
$ make bash
```

### Run test
```bash
$ make test
```

### Run lint
```bash
$ make lint
```

<hr class="footnotes-sep">
<section class="footnotes">
    <ol class="footnotes-list">
        <li id="fn1"  class="footnote-item">
            <p>
                It cannot handle packages which have a specific version for GPU environment like tensorflow.
                Therefore they are installed in Dockerfiles.<a href="#fnref1" class="footnote-backref">↩</a>
            </p>
        </li>
    </ol>
</section>