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
?- assign_quiz(quiz(csen403, sun, 5, 2), [day(sat, [[s, m], [m], [m], [m], [s, m]]), day(sun, [[s], [s, h, m], [], [s, m], [s, h, m]]), day(mon, [[s, m], [s, h, m], [s, m], [s, m], [s, h, m]]), day(tue, [[h, m], [h], [h], [h, m], [h]]), day(wed, [[s, h, m], [s, h, m], [s, h], [s, h], [s, h, m]]), day(thu, [[s, h], [h], [h], [s, h], [s, h]])], AssignedTAs).
```  
**Output:**  
```prolog  
AssignedTAs = [s, h] ;
AssignedTAs = [h, s] ;
AssignedTAs = [s, m] ;
AssignedTAs = [m, s] ;
AssignedTAs = [h, m] ;
AssignedTAs = [m, h] ;
false.
```  

## Why Prolog? 🤔  
Prolog's logical reasoning and constraint-solving capabilities make it the perfect choice for tackling complex scheduling problems.  

## Future Enhancements 🚀  
- Integrating a graphical user interface for easier interaction.  
- Supporting real-time updates for last-minute changes.  
- Advanced optimization for larger-scale scheduling.  
