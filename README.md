Mattermost Source-to-Image Docker images
========================================

This repository contains the source for building a Mattermost
application as a reproducible Docker image using
[source-to-image](https://github.com/openshift/source-to-image).

The resulting image can be run using [Docker](http://docker.io).

For more information about using these images with OpenShift, please see the
official [OpenShift Documentation](https://docs.openshift.org/latest/using_images/s2i_images/nodejs.html).


Installation
------------

To build the Mattermost image

    ```
    $ git clone https://github.com/goern/s2i-mattermost.git
    $ cd s2i-mattermost
    $ make
    ```


Test
----
This repository also provides a [S2I](https://github.com/openshift/source-to-image)
test framework, which launches tests to check functionality of a Mattermost
application built on top of the s2i-mattermost image.

    ```
    $ cd s2i-mattermost
    $ make test
    ```

Image name schema
-----------------

0. S2I indicator - s2i
1. Framework name (lowercase) - mattermost
2. Platform version (without dots) - 310
3. Base builder image - centos7

Examples: `goern/s2i-mattermost-310-centos7`
