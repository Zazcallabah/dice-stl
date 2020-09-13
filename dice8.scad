// Source: Tim Edwards, https://www.thingiverse.com/timedwards/designs, http://opencircuitdesign.com, Creative Commons - Attribution - Share Alike

//------------------------------------------
// Polygonal dice
//------------------------------------------

//------------------------------------------
// Geometric regular solids in OpenSCAD
//------------------------------------------

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

module octatext(height) {

    rotate([0, 0, 180])
    translate([0, 0, 0.5 * height - 1])
    linear_extrude(height=2)
	text("1", size=0.55 * height,
			valign="center", halign="center");

    translate([0, 0, -0.5 * height + 1])
    rotate([0, 180, 180])
    linear_extrude(height=2)
	text("8", size=0.55 * height,
			valign="center", halign="center");

    // Loop i from 0 to 2, and intersect results
    for (i = [0:2]) { 
	rotate([109.47122, 0, 120 * i]) {
	    translate([0, 0, 0.5 * height - 1])
	    linear_extrude(height=2)
		text(textvals[i*2 + 1], size=0.55 * height,
			valign="center", halign="center");

	    translate([0, 0, -0.5 * height + 1])
	    rotate([0, 180, 180])
	    linear_extrude(height=2)
		text(textvals[6 - i*2], size=0.55 * height,
			valign="center", halign="center");
	}
    }
}

translate ([0, 0, 9]) {
	difference() {
	    intersection() {
		octahedron(18);
		rotate([45, 35, -30])
		    cube([29, 29, 29], center = true);
	    }
	    octatext(18);
	}
}
