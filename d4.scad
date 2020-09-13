// Source: Tim Edwards, https://www.thingiverse.com/timedwards/designs, http://opencircuitdesign.com, Creative Commons - Attribution - Share Alike

//------------------------------------------
// Polygonal dice
//------------------------------------------

//------------------------------------------
// Geometric regular solids in OpenSCAD
//------------------------------------------

module tetrahedron(height) {
    scale([height, height, height]) {	// Scale by height parameter
	polyhedron(points = [
		[-0.288675, 0.5, /* -0.27217 */ -0.20417],
		[-0.288675, -0.5, /* -0.27217 */ -0.20417],
		[0.57735, 0, /* -0.27217 */ -0.20417],
		[0, 0, /* 0.54432548 */ 0.612325]],
	faces = [[1, 2, 0],
		[3, 2, 1],
		[3, 1, 0],
		[2, 3, 0]]);
    }
}

//------------------------------------------
// Text modules
//------------------------------------------

textvals=["1", "2", "3", "4", "5", "6", "7", "8",
	"9", "10", "11", "12", "13", "14", "15",
	"16", "17", "18", "19", "20"];

underscore=[" ", " ", " ", " ", " ", "_", " ", " ",
	"_", " ", " ", " ", " ", " ", " ",
	" ", " ", " ", " ", " "];


ttext=["1", "2", "3", "4", "3", "2", "4", "2", "1", "4", "1", "3"];

otext=["1", "2", "3", "15", "19", "6", "7", "8",
	"9", "10", "12", "4", "20", "5", "14",
	"11", "18", "17", "13", "16"];

module tetratext(height) {
    rotate([180, 0, 0])
    translate([0, 0, 0.2 * height - 1])
    for (i = [0:2]) { 
	rotate([0, 0, 120 * i])
	translate([0.3 * height, 0, 0])
	rotate([0, 0, -90])
	linear_extrude(height=2)
	    text(ttext[i], size=0.2 * height,
			valign="center", halign="center");
    }

    for (j = [0:2]) { 
	rotate([0, -70.5288, j * 120])
	translate([0, 0, 0.2 * height - 1])
	for (i = [0:2]) { 
	    rotate([0, 0, 120 * i])
	    translate([0.3 * height, 0, 0])
	    rotate([0, 0, -90])
	    linear_extrude(height=2)
		text(ttext[(j + 1) * 3 + i], size=0.2 * height,
			valign="center", halign="center");
	}
    }
}

//------------------------------------------
// Complete dice
//------------------------------------------

translate ([0, 0, 34 * 0.20417]) {
	difference() {
	    intersection() {
		tetrahedron(34);
		rotate([0, 180, 0])
		    tetrahedron(90);
	    }
	    tetratext(34);
	}
}
