Docker container for running [Folding@Home](http://folding.stanford.edu/)

### Usage
```bash
# Get the docker container
make docker-pull

# Run folding@home
make fold USERNAME=My_User TEAM=11675 GPU=true POWER=full
```

The web console is available on port `7396`.

