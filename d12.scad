// Source: Tim Edwards, https://www.thingiverse.com/timedwards/designs, http://opencircuitdesign.com, Creative Commons - Attribution - Share Alike

//------------------------------------------
// Polygonal dice
//------------------------------------------

//------------------------------------------
// Geometric regular solids in OpenSCAD
//------------------------------------------

module dodecahedron(height) {
    intersection() {
	// Make a cube
	cube([2 * height, 2 * height, height], center = true); 

	// Loop i from 0 to 4, and intersect results
	intersection_for(i = [0:4]) { 
	    // Make a cube, rotate it 116.565 degrees around the X axis,
	    // then 72 * i around the Z axis
	    rotate([0, 0, 72 * i])
	    rotate([116.565, 0, 0])
	    cube([2 * height, 2 * height, height], center = true); 
	}
    }
}

module octahedron(height) {
    intersection() {
	// Make a cube
	cube([2 * height, 2 * height, height], center = true); 

	// Loop i from 0 to 2, and intersect results
	intersection_for(i = [0:2]) { 
	    // Make a cube, rotate it 109.47122 degrees around the X axis,
	    // then 120 * i around the Z axis
	    rotate([109.47122, 0, 120 * i])
	    cube([2 * height, 2 * height, height], center = true); 
	}
    }
}

w=-15.525;

module icosahedron(height) {
    intersection() {

	octahedron(height);

	rotate([0, 0, 60 + w])
	    octahedron(height);

	intersection_for(i = [1:3]) { 
	    rotate([0, 0, i * 120])
	    rotate([109.471, 0, 0])
	    rotate([0, 0, w])
		octahedron(height);
	}
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


module octahalf(height, j) {
    rotate([0, 0, 180]) {
	rotate([0, 0, 39])
	translate([0, 0, 0.5 * height - 1])
	linear_extrude(height=2)
	    text(otext[j], size=0.21 * height,
			valign="center", halign="center");

	rotate([0, 0, 39])
	translate([0, 4, 0.5 * height - 1])
	linear_extrude(height=2)
	    text(underscore[j], size=0.21 * height,
			valign="center", halign="center");
    }

    // Loop i from 0 to 2, and intersect results
    for (i = [0:2]) { 
	rotate([109.47122, 0, 120 * i]) {
	    rotate([0, 0, 39])
	    translate([0, 0, 0.5 * height - 1])
	    linear_extrude(height=2)
		text(otext[i + j + 1], size=0.21 * height,
			valign="center", halign="center");

	    rotate([0, 0, 39])
	    translate([0, 4, 0.5 * height - 1])
	    linear_extrude(height=2)
		text(underscore[i + j + 1], size=0.21 * height,
			valign="center", halign="center");
	}
    }
}


module dodecatext(height) {

    rotate([0, 0, 180])
    translate([0, 0, 0.5 * height - 1])
    linear_extrude(height=2)
	text("1", size=0.3 * height, valign="center", halign="center");

    translate([0, 0, -0.5 * height + 1])
    rotate([0, 180, 0])
    linear_extrude(height=2)
	text("12", size=0.3 * height, valign="center", halign="center");

    // Loop i from 0 to 4, and intersect results
    for (i = [0:4]) { 
	rotate([0, 0, 72 * i])
	rotate([116.565, 0, 0]) {
	    translate([0, 0, 0.5 * height - 1])
	    linear_extrude(height=2)
		text(textvals[i*2 + 1], size=0.3 * height,
			valign="center", halign="center");

	    translate([0, -4, 0.5 * height - 1])
	    linear_extrude(height=2)
		text(underscore[i*2 + 1], size=0.3 * height,
			valign="center", halign="center");

	    translate([0, 0, -0.5 * height + 1])
	    rotate([0, 180, 180])
	    linear_extrude(height=2)
		text(textvals[10 - i*2], size=0.3 * height,
			valign="center", halign="center");

	    translate([0, 5, -0.5 * height + 1])
	    rotate([0, 180, 0])
	    linear_extrude(height=2)
		text(underscore[10 - i*2], size=0.3 * height,
			valign="center", halign="center");
	}
    }
}

//------------------------------------------
// Complete dice
//------------------------------------------
translate ([0, 0, 11]) {
	difference() {
	    intersection() {
		dodecahedron(22);
		rotate([35, 10, -18])
		    icosahedron(26.8);
	    }
	    dodecatext(22);
	}
}

