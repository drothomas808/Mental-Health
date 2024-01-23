select * from mentalHealth;

-- Demographic Analysis --

# Exploring the average age of participants grouped by gender
SELECT Gender, 
	   ROUND(AVG(Age)) AS AvgAge
FROM mentalHealth
GROUP BY Gender;

# Exploring the diffenrent occupations among participants
SELECT Occupation, 
       COUNT(*) AS ParticipantsCount
FROM mentalHealth
GROUP BY Occupation;

# Exploring the distribution of participants across different age groups
SELECT CASE
         WHEN Age BETWEEN 18 AND 25 THEN '18-25'
         WHEN Age BETWEEN 26 AND 35 THEN '26-35'
         WHEN Age BETWEEN 36 AND 45 THEN '36-45'
         ELSE '46+'
       END AS AgeGroup,
       COUNT(*) AS ParticipantsCount
FROM mentalHealth
GROUP BY AgeGroup;
-- ------------------------------------ --

-- Quarantine Impact Analysis --

# Calculating the percentage of participants with growing stress
SELECT COUNT(*) AS GrowingStressCount,
       ROUND((COUNT(*) * 100 / (SELECT COUNT(*) FROM mentalHealth))) AS PercentageGrowingStress
FROM mentalHealth
WHERE Growing_Stress = 'Yes';

# Exploring the relationship between quarantine frustration and coping struggles
SELECT Quarantine_Frustrations, 
	   Coping_Struggles, 
       COUNT(*) AS Count
FROM mentalHealth
GROUP BY Quarantine_Frustrations, Coping_Struggles;
-- ------------------------------------ --

-- Health and Lifestyle Changes --

# Exploring the weight change that took place in particpants
SELECT Weight_Change AS AvgWeightChange,
	   Count(*) AS Amount
FROM mentalHealth
GROUP BY AvgWeightChange;

# Exploring the relationship between mood swings and changes in eating habits
SELECT Mood_Swings, 
       Changes_Habits, 
       COUNT(*) AS Count
FROM mentalHealth
GROUP BY Mood_Swings, Changes_Habits
ORDER BY 1;
-- ------------------------------------ --

-- Work-related Analysis -- 

# Calculate the percentage of participants who are losing interest in their work
SELECT Work_Interest, 
       COUNT(*) AS Count
FROM mentalHealth
GROUP BY Work_Interest;

# Exploring distribution of participants based on their work interest and social weakness
SELECT Social_Weakness, 
       Work_Interest, 
       COUNT(*) AS Count
FROM mentalHealth
GROUP BY Social_Weakness, Work_Interest;

