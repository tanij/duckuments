\subsection{Task: Lane following}\label{sec:lf}


The first task of the *AI Driving Olympics* is "Lane following".

In this task, we ask participants to submit code allowing the Duckiebot to drive on the right-hand side of the street within Duckietown without a specific goal point. Duckiebots will drive through the Duckietown and will be judged on how fast they drive, how well they follow the rules and how smooth or "comfortable" their driving is. Please refer to the following \href{https://drive.google.com/file/d/198iythQkovbQkzY3pPeTXWC8tTCRgDwB/view?usp=sharing}{video of a lane following demo} for a short demonstration.


The task is designed in a way that should allow for a completely \emph{reactive} algorithm design. This meant to say that to accomplish the task, it should not be strictly necessary to keep past observations in memory.


To better illustrate the "Lane following" task we provide Fig.~\ref{fig:bird_eye_lf}, \ref{fig:ego_view_lf}, \ref{fig:bird_eye_lf_crossing} and \ref{fig:ego_view_lf_crossing}.

\JZ{PICTURE OF EGO PERSPECTIVE HERE}

\begin{figure}[h]
\centering
\begin{minipage}{.5\textwidth}
  \centering
  \includegraphics[width=.8\linewidth]{images/in_lane.jpeg}
  \captionof{figure}{A figure}
  \label{fig:bird_eye_lf}
\end{minipage}%
\begin{minipage}{.5\textwidth}
  \centering
  \includegraphics[width=.8\linewidth]{images/in_lane_sideview.jpg}
  \captionof{figure}{Another figure}
  \label{fig:ego_view_lf}
\end{minipage}
\end{figure}


\begin{figure}[h]
\centering
\begin{minipage}{.5\textwidth}
  \centering
  \includegraphics[width=.8\linewidth]{images/crossing_lane.jpg}
  \captionof{figure}{A figure}
  \label{fig:bird_eye_lf_crossing}
\end{minipage}%
\begin{minipage}{.5\textwidth}
  \centering
  \includegraphics[width=.8\linewidth]{images/crossing_lane_sideview.jpg}
  \captionof{figure}{Another figure}
  \label{fig:ego_view_lf_crossing}
\end{minipage}
\end{figure}
