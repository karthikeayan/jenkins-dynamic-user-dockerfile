FROM python:3.8.3

ARG GID
ARG UID
ARG UNAME

ENV GROUP_ID=$GID
ENV USER_ID=$UID
ENV USERNAME=$UNAME

RUN mkdir /home/$USERNAME

RUN groupadd -g $GROUP_ID $USERNAME
RUN useradd -r -u $USER_ID -g $USERNAME -d /home/$USERNAME $USERNAME
RUN chown $USERNAME:$USERNAME /home/$USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME

RUN python -m venv testpipe_venv

CMD ["/bin/bash -c 'source testpipe_venv/bin/activate'"]
