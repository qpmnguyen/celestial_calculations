class dms:
    """
    Object for storing angles in the format of degree, minute, second
    Parameters
    ----------
    deg: Degree
    arcm: Arcminutes
    arcs: Arcseconds

    Methods
    -------
    get_degree(): Retreive the degree component
    get_arcminute(): Retrieve the arcminute component
    get_arcsecond(): Retrieve the arcsecond component

    to_numeric(): Convert numeric to dms class
    """
    def __init__(self, deg, arcm, arcs):
        return("{deg}o{arcm}'{arcs}''".format(deg = str(deg), 
                                             arcm = str(arcm), 
                                             arcs = str(arcs)))
