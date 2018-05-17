## Task: Lane following {#lf}


The first task of the *AI Driving Olympics* is "Lane following".

In this task, we ask participants to submit code allowing the Duckiebot to drive on the right-hand side of the street within Duckietown without a specific goal point. Duckiebots will drive through the Duckietown and will be judged on how fast they drive, how well they follow the rules and how smooth or "comfortable" their driving is. Please refer to the following [video of a lane following demo](https://drive.google.com/file/d/198iythQkovbQkzY3pPeTXWC8tTCRgDwB/view?usp=sharing) for a short demonstration.


The task is designed in a way that should allow for a completely \emph{reactive} algorithm design. This meant to say that to accomplish the task, it should not be strictly necessary to keep past observations in memory.


To better illustrate the "Lane following" task we provide [](#bird_eye_lf), [](#ego_view_lf), [](#bird_eye_lf_crossing) and [](#ego_view_lf_crossing).

TODO: JZ: PICTURE OF EGO PERSPECTIVE HERE

<div figure-id="fig:views1">
    <img src="images/in_lane.jpg" figure-id="subfig:bird_eye_lf"/>
    <img src="images/in_lane_sideview.jpg" figure-id="subfig:ego_view_lf"/>
</div>
 

<div figure-id="fig:views2">
    <img src="images/crossing_lane.jpg" figure-id="subfig:bird_eye_lf_crossing"/>
    <img src="images/crossing_lane_sideview.jpg" figure-id="subfig:ego_view_lf_crossing"/>
</div>
 
 
<style>
#fig\:views1 img,
#fig\:views2 img {
width: 20em; 
}
</style>