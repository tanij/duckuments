# Referring to Github files {#markduck-github status=ready}

You can refer to files in the repository by using:

    See [this file](github:org=![org],repo=![repo],path=![path],branch=![branch]).

The available keys are:

- `org` (required): organization name (e.g. `duckietown`);
- `repo` (required): repository name (e.g. `Software`);
- `path` (required): the filename. Can be just the file name or also include directories;
- `branch` (optional) the repository branch; defaults to `master`;


For example, you can refer to [the file `pkg_name/src/subscriber_node.py`][link1] by using the following syntax:

[link1]: github:org=duckietown,repo=Software,path=pkg_name/src/subscriber_node.py

    See [this file](github:org=duckietown,repo=Software,path=pkg_name/src/subscriber_node.py)

You can also refer to a particular line:

This is done using the following parameters:

- `from_text` (optional): reference the first line containing the text;
- `from_line` (optional): reference the line by number;


For example, you can refer to [the line containing "Initialize"][link2]
of `pkg_name/src/subscriber_node.py` by using the following syntax:

[link2]: github:org=duckietown,repo=Software,path=pkg_name/src/subscriber_node.py,from_text=Initialize


    For example, you can refer to [the line containing "Initialize"][link2]
    of `pkg_name/src/subscriber_node.py` by using the following syntax:

    [link2]: github:org=duckietown,repo=Software,path=pkg_name/src/subscriber_node.py,from_text=Initialize


You can also reference a range of lines, using the parameters:

- `to_text` (optional): references the final line, by text;
- `to_line` (optional): references the final line, by number.

You cannot give `from_text` and `from_line` at the same time.
You cannot give a `to_...` without the `from_...`.

For example, [this link refers to a range of lines][interval]: click it to see how Github highlights the lines from "Initialize" to "spin".

[interval]: github:org=duckietown,repo=Software,path=pkg_name/src/subscriber_node.py,from_text=Initialize,to_text=spin

This is the source of the previous paragraph:

    For example, [this link refers to a range of lines][interval]: click it to see how Github highlights the lines from "Initialize" to "spin".

    [interval]: github:org=duckietown,repo=Software,path=pkg_name/src/subscriber_node.py,from_text=Initialize,to_text=spin


## Putting code from the repository in line

In addition to referencing the files, you can also copy the contents of a file inside the documentation.

This is done by using the tag `display-file`.

For example, you can put a copy of `pkg_name/src/subscriber_node.py` using:

    <display-file src="
        github:org=duckietown,
        repo=Software,
        path=pkg_name/src/subscriber_node.py
    "/>

and the result is the following automatically generated listing:

<display-file src="github:
    org=duckietown,
    repo=Software,
    path=pkg_name/src/subscriber_node.py
"/>

If you use the `from_text` and `to_text` (or `from_line` and `to_line`), you can actually display part of a file. For example:

    <display-file src="
        github:org=duckietown,
        repo=Software,
        path=pkg_name/src/subscriber_node.py,
        from_text=Initialize,
        to_text=spin
        "/>

creates the following automatically generated listing:

<display-file src="github:org=duckietown,
repo=Software,
path=pkg_name/src/subscriber_node.py,
from_text=Initialize,
to_text=spin"/>
