# Example multi-image build process

This is just to show how a coordinating docker container can run multiple other docker containers to build a project

In this case the builder does nothing aside from invoke `make`, but could also be doing other tasks such as ryncing files, or publishing assets post-build

It additionally tags local images before running. This is just to show how extra dependencies could be added to the base images if needed
