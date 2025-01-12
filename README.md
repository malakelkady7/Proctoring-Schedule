 # Smart Proctoring Scheduler 🕒📚  
A Prolog-based system designed to automate the scheduling of Teaching Assistants (TAs) for quiz proctoring. This project ensures efficient and conflict-free assignments by respecting teaching schedules, day-offs, and other constraints.  

## Features 🌟  
- **Constraint-Aware Scheduling:**  
  - Assigns TAs based on availability and rules.  
  - Avoids conflicts with teaching schedules and day-offs.  
  - Ensures no TA is double-booked during the same slot.  

- **Validation Capabilities:**  
  - Verifies if a given proctoring schedule is valid.  
  - Detects and resolves scheduling conflicts.  

- **Flexibility:**  
  - Supports multiple quizzes in the same slot.  

## How It Works 🛠️  
The system is powered by four Prolog predicates:  
1. `assign_proctors/4`: Assigns TAs to quizzes based on constraints.  
2. `free_schedule/3`: Determines when TAs are free for proctoring.  
3. `assign_quizzes/3`: Allocates quizzes to available TAs.  
4. `assign_quiz/3`: Handles single quiz assignments with precision.  

## Example Usage 💡  
```prolog  
?- assign_proctors(
    [ta(s,tue), ta(h,mon), ta(m,thu), ta(a,sat)],
    [quiz(csen403, sun, 5, 2), quiz(csen401, mon, 2, 3)],
    [day(sat, [[], [s], [s], [s], []]),
     day(sun, [[m, h], [], [s, m, h], [h], []]),
     day(mon, [[h], [], [h], [h], []]),
     day(tue, [[], [m], [m], [], [m]]),
     day(wed, [[], [], [m], [m], []]),
     day(thu, [[], [s], [s], [], []])],
    ProctoringSchedule
).  
```  
**Output:**  
```prolog  
ProctoringSchedule = [
    proctors(quiz(csen403, sun, 5, 2), [s, h]),
    proctors(quiz(csen401, mon, 2, 3), [m, a, h])
];  
```  

## Why Prolog? 🤔  
Prolog's logical reasoning and constraint-solving capabilities make it the perfect choice for tackling complex scheduling problems.  

## Future Enhancements 🚀  
- Integrating a graphical user interface for easier interaction.  
- Supporting real-time updates for last-minute changes.  
- Advanced optimization for larger-scale scheduling.  
