# Task: Fleet management in Duckietown {#fleet_manag status=beta}


Task 4 further scales task 3. Now you are asked to control multiple Duckiebots at once. You will be provided with location pairs $(A,B,t)$ provided at time $t$. Performance will be measured based on how quickly these location pairs can be served with the available fleet of Duckiebots. 

This scenario is meant to resemble a taxi-service. Customer request to go from location "A" to location "B" arrive sequentially and need to be served in an intelligent manner. 


TODO: PICTURE OF MAP PERSPECTIVE HERE - with other vehicles in sight, with A, and B (start-destination shown)

<div figure-id="fig:Autolab_map">
 <img src="images/Autolab_map.png" style="width: 90%"/>
 <figcaption>Map of a Duckietown provided to illustrate Task 3 and 4. Best viewed in color.</figcaption>
</div>

## Platform


## Description of task

## Performance metrics



### Performance objective

As performance objective on task 4, we again calculate the expected time to go from point A to point B. The difference to task 3 is that now multiple trips $(A,B)$ may be active at the same time. Likewise, multiple Duckiebots are now available to service the additional requests. To reliably evaluate the metric, multiple pairs of points A, B will be sampled. 


$$
\objective_{speed}(t) = \expectation_{A,B}[T_{A \to B}]
$$

TODO: How to measure properly?
 

### Rule objectives

Similar to tasks 1 and 2, the rules of the road have to be observed. 

Penalty when straying from lane:

$$
\objective_{LF} = \begin{cases} 0  & \text{if } d < d_{safety} \\
 	\beta d^2 & \text{if } d_{safety} \leq d \leq d_{max} \\
 	\alpha & \text{if } d > d_{max} \text{ or if $d$ is not within field-of-view anymore}
 	\end{cases}
$$


STOP sign:

$$
 	J_{STOP} = \begin{cases} 0  & \text{if } p_{bot} \notin S_{zone}\\
 	\gamma & \text{if } \nexists t \text{ s.t. } v_t=0 \text{ and }  p_{bot} \in S_{zone}\\
 	0 & \text{if } p_{bot} \in S_{zone} \text{ and } \exists v_t=0
 	\end{cases}
$$

Avoid collision:

$$
 	J_{AC} = \begin{cases} 0 & \text{if } d > \epsilon, \\
 	\nu & \text{if } d < \epsilon.
 	\end{cases}
$$

Time intervals are chosen to allow for maneuvering after collisions without incurring further costs.

Yield right of way:

$$
 	J_{YR} = \begin{cases} 0 & \text{driving while right hand side if free at intersection} \\
 	\mu & \text{driving while right hand side if occupied at intersection}
 	\end{cases}
$$


### Comfort objectives

Additionally, driving "comfortably" will be measured. Comfort in this case is trying to promote smoothness of the vehicle behavior by penalizing changes in the input commands. 

$$
\objective_{CM} = \expectation[ ||\Delta u_k ||_1] \approx \frac{1}{N} \sum_k^N |\Delta u_k|
$$

Maximal waiting time:

$$
\objective_{WT} = ||T_{wait} ||_\infty]
$$

The robot $\robot$ used in this task is a Duckiebot as described in [](#robot). The environment of the task is Duckietown as described in [](#environment). Different to task 1 and 2, the input to the Duckiebot now also includes a map of Duckietown. 

TODO: determine map of Duckietown


## Interface


## Protocol


## Related work
