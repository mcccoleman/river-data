# river-data

River data is a ruby module (that I plan on making into a gem once completed) that makes the [USGS](https://www.usgs.gov/)'s [River data API](https://www.usgs.gov/products/web-tools/apis) available to Ruby users. Please note that, as of this iteration, the project does not mutate or update the data returned from the USGS, it only passes through the information that they provide.

# contributing

If interested in contributing, please email Michael Coleman at <colemanmc02@gmail.com>.

# future iterations

As of now, no data transformations are made from what is returned from the USGS. That said, in working with this data there are a few future improvements to this structure that would aid developers in utilizing this data. A running list is included here:

- Organize river properties as keys values instead of elements of an array.
- Consolidate all information related to a river in one location.
