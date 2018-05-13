## Overview of tasks {#task_overview}


\JZ{Fix links to go to correct sections}

\begin{figure}[h!]
\centering

\begin{minipage}{.17\textwidth}
  \centering
  \hyperref[sec:lf]{\includegraphics[height=2.7cm, width=\linewidth]{images/in_lane.jpeg}}
  \captionof{figure}{Lane following}
  \label{fig:task_lf}
\end{minipage}
\hfill
\begin{minipage}{.17\textwidth}
  \centering
  \hyperref[sec:lf_v]{\includegraphics[height=2.7cm, width=\linewidth]{images/lane_following_v.jpg}}
  \captionof{figure}{Lane following + v}
  \label{fig:task_lf_v}
\end{minipage}
\hfill
\begin{minipage}{.17\textwidth}
  \centering
  \hyperref[sec:nav_v]{\includegraphics[height=2.7cm, width=\linewidth]{Autolab_map.pdf}}
  \captionof{figure}{Navigation + v}
  \label{fig:nav_v}
\end{minipage}
\hfill
\begin{minipage}{.17\textwidth}
  \centering
  \hyperref[sec:fleet_manag]{\includegraphics[height=2.7cm, width=\linewidth]{images/fleet_management.jpg}}
  \captionof{figure}{Fleet management}
  \label{fig:fleet_management}
\end{minipage}
\hfill
\begin{minipage}{.17\textwidth}
  \centering
  \hyperref[sec:amod]{\includegraphics[height=2.7cm, width=\linewidth]{amod_gray3.png}}
  \captionof{figure}{AMoD coordination}
  \label{fig:amod}
\end{minipage}
\end{figure}

The AI Driving Olympics competition is structured into the following five separate tasks:

\begin{itemize}
\item \textbf{Embodied individual robot tasks:} Tasks within which code to control a single Duckiebot is submitted.
	\begin{itemize}
    \item \hyperref[sec:embodied_tasks]{\textit{Lane following:}} Control of a Duckiebot to drive on the right lane on streets within Duckietown without other moving Duckiebots present. For a detailed description click Fig.~\ref{fig:task_lf} to redirect to section~\ref{sec:lf}.
    \item \hyperref[sec:embodied_tasks]{\textit{Lane following + vehicles:}}
    Control of a Duckiebot to drive on the right lane on streets within Duckietown with other moving Duckiebots present. For a detailed description click Fig.~\ref{fig:task_lf_v} to redirect to section~\ref{sec:lf_v}.
    \item \hyperref[sec:embodied_tasks]{\textit{Navigation + vehicles:}}
    Navigation task of a Duckiebot to drive from point $A$ to point $B$ while following the rules of the road and while other Duckiebots are likewise driving in the road. For a detailed description click Fig.~\ref{fig:nav_v} to redirect to section~\ref{sec:nav_v}.
	\end{itemize}
\item \textbf{Fleet-level social tasks:} Tasks within which code to control multiple robots or agents is submitted while lower-level functions are already provided.
  \begin{itemize}
  \item \hyperref[sec:embodied_tasks]{\textit{Fleet management:}} Task to control a small fleet of Duckiebots within Duckietown to pick up a set of virtual customers and drive them to a destination point. For a detailed description click Fig.~\ref{fig:fleet_management} to redirect to section~\ref{sec:nav_v}.
  \item \hyperref[sec:embodied_tasks]{\textit{Autonomous Mobility-on-Demand:}} Task to control the movement of a fleet of autonomous vehicles in a simulated city to pick up customers and drive them to their destinations. For a detailed description click Fig.~\ref{fig:amod} to redirect to section~\ref{sec:amod}.
  \end{itemize}
\end{itemize}


Participants may submit code to each challenge individually. Tasks proposed in the *AI Driving Olympics* are ordered first by type and secondly by increasing difficulty in a way which encourages modular reuse of solutions to previous tasks.

For a mathematical introduction to solving tasks in the context in robotics, please refer to section~\ref{sec:general_problem}.
