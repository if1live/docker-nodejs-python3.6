# https://hub.docker.com/_/node/
FROM node:9.6-stretch

# https://github.com/chriskuehl/python3.6-debian-stretch
# The name is too long, 265 chars total.
# Trying to shorten...
# 명령이 잘리지 않도록 미리 자름
ENV PYTHON_BASE_URL "https://github.com/chriskuehl/python3.6-debian-stretch/releases/download/v3.6.3-1-deb9u1"
RUN wget ${PYTHON_BASE_URL}/python3.6_3.6.3-1.deb9u1_amd64.deb
RUN wget ${PYTHON_BASE_URL}/python3.6-minimal_3.6.3-1.deb9u1_amd64.deb
RUN wget ${PYTHON_BASE_URL}/python3.6-dev_3.6.3-1.deb9u1_amd64.deb
RUN wget ${PYTHON_BASE_URL}/libpython3.6_3.6.3-1.deb9u1_amd64.deb
RUN wget ${PYTHON_BASE_URL}/libpython3.6-minimal_3.6.3-1.deb9u1_amd64.deb
RUN wget ${PYTHON_BASE_URL}/libpython3.6-stdlib_3.6.3-1.deb9u1_amd64.deb
RUN wget ${PYTHON_BASE_URL}/libpython3.6-dev_3.6.3-1.deb9u1_amd64.deb
RUN dpkg -i *.deb

# required for pipenv install
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# https://pip.pypa.io/en/stable/installing/
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py
RUN pip3.6 install pipenv

RUN npm install -g yarn

RUN echo "python\t: $(python3.6 --version)"
RUN echo "pip\t: $(pip3.6 --version)"
RUN echo "pipenv\t: $(pipenv --version)"
RUN echo "node\t: $(node --version)"
RUN echo "yarn\t: $(yarn --version)"