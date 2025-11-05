use <PCBMount.scad>

XYMosMount();

module XYMosMount() {

difference(){
PCBMount(
    pcb_width = 17,
    pcb_depth = 34,
    pcb_thickness = 1.6,
    pcb_mounting_holes = [
        [1.6,1.5],[15.4,1.5]
    ],
    leftWall = true,
    rightWall = true,
    backWall = false,
    frontWall = true


);
translate([-1,25,6]){
    cube([1000,15,1000]);
};

}
}