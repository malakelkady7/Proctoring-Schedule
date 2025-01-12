🧠 Smart Proctoring Scheduler: Where Logic Meets Academia! 📚
Say goodbye to the chaos of manual quiz proctoring schedules! This Prolog-powered scheduler is a brainy assistant designed to handle the intricate task of assigning Teaching Assistants (TAs) to quizzes while meeting every rule in the book. It's more than just code; it’s your ticket to stress-free scheduling.

🌟 Project Vision
Imagine a world where every TA gets their fair share of duty, no one’s day-off is interrupted, and quizzes run like clockwork. This project turns that vision into reality by leveraging Prolog’s logical prowess to create a robust, constraint-aware scheduling solution.

🔥 What Makes It Special?
Rule-Obsessed Logic:

No TA on their day off? ✅
No double-duty conflicts? ✅
Teaching schedules respected? ✅
Dynamic Adaptability: Handles overlapping quizzes and varying TA availability with ease.

Validation Superpowers: Verify or reject any given schedule based on strict academic rules.

🛠️ How It Works (The Geeky Stuff)
This scheduler revolves around four brainy Prolog predicates:

assign_proctors/4: Automagically generates valid proctoring schedules by analyzing TA availability and quiz needs.
free_schedule/3: Spies on the free slots of every TA while respecting their commitments.
assign_quizzes/3: Balances quiz proctoring requirements with available resources.
assign_quiz/3: Dives deep to assign a single quiz without breaking the rules.
💡 Use Case Demo
Want to assign TAs to quizzes? Let Prolog do the heavy lifting:

prolog
Copy code
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
Output:

prolog
Copy code
ProctoringSchedule = [
    proctors(quiz(csen403, sun, 5, 2), [s, h]),
    proctors(quiz(csen401, mon, 2, 3), [m, a, h])
];
🚀 Why Prolog is the Hero Here
Prolog isn’t just a language—it’s a logic powerhouse! With its ability to handle constraints and logical queries, this project demonstrates Prolog’s brilliance in academic scheduling.
