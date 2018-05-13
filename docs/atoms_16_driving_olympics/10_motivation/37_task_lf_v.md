## Task: Lane following + Dynamic vehicles {#lf_v}

The second task of the *AI Driving Olympics* is "Lane following with dynamic vehicles".
This task is an extension of Task 1 to include additional rules of the road and other moving vehicles.

Again we ask participants to submit code allowing the Duckiebot to drive on the right-hand side of the street within Duckietown. Due to interactions with other Duckiebots, the task is designed no longer completely \emph{reactive}. Especially at intersections, the STOP-sign will have to be observed, which requires keeping track of at least some past information.

\JZ{PICTURE OF EGO PERSPECTIVE HERE - with other vehicles in sight}

\JZ{Ego perspective pictures for collision and intersection - yield position}

\begin{figure}[h]
\centering
\begin{minipage}{.5\textwidth}
  \centering
  \includegraphics[width=.8\linewidth]{images/lane_following_v.jpg}
  \captionof{figure}{A figure}
  \label{fig:lane_following_v}
\end{minipage}%
\begin{minipage}{.5\textwidth}
  \centering
  \includegraphics[width=.8\linewidth]{images/in_lane_sideview.jpg}
  \captionof{figure}{Another figure}
  \label{fig:lane_following_v_ego}
\end{minipage}
\end{figure}


\begin{figure}[h]
\centering
\begin{minipage}{.5\textwidth}
  \centering
  \includegraphics[width=.8\linewidth]{images/collision1.jpg}
  \captionof{figure}{A figure}
  \label{fig:collision1}
\end{minipage}%
\begin{minipage}{.5\textwidth}
  \centering
  \includegraphics[width=.8\linewidth]{images/yield.jpg}
  \captionof{figure}{Another figure}
  \label{fig:yield}
\end{minipage}
\end{figure}


The robot $\robot$ used in this task is a Duckiebot as described in subsection~\ref{subsubsec:robot}. The environment of the task is Duckietown as described in subsection~\ref{subsubsec:environment}. Different to task 1, the environment now includes intersections, STOP-signs and other moving vehicles.
