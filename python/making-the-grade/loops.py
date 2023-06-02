
def round_scores(student_scores):
    """
    :param student_scores: list of student exam scores as float or int.
    :return: list of student scores *rounded* to nearest integer value.
    """

    rounded_score = []
    for score in student_scores:
        rounded_score.append(round(score))
    return rounded_score

def count_failed_students(student_scores):
    """
    :param student_scores: list of integer student scores.
    :return: integer count of student scores at or below 40.
    """

    failed_students = 0
    for score in student_scores:
        if score <= 40:
            failed_students = failed_students + 1
    return failed_students


def above_threshold(student_scores, threshold):
    """
    :param student_scores: list of integer scores
    :param threshold :  integer
    :return: list of integer scores that are at or above the "best" threshold.
    """

    best_score = []
    for score in student_scores:
        if score >= threshold:
            best_score.append(score)
    return best_score


def letter_grades(highest):
    """
    :param highest: integer of highest exam score.
    :return: list of integer score thresholds for each F-A letter grades.
    """

    increments = (highest-40)/4

    lower_score_threshold = [41]
    last_value = 41

    while True:
        last_value = last_value + increments

        if last_value > highest:
            break

        lower_score_threshold.append(int(last_value))
 
    return lower_score_threshold

def student_ranking(student_scores, student_names):
    """
     :param student_scores: list of scores in descending order.
     :param student_names: list of names in descending order by exam score.
     :return: list of strings in format ["<rank>. <student name>: <score>"].
     """
    rank_list = []
    for index, students in enumerate(student_names):
        rank_holders = f"{index+1}. {students}: {student_scores[index]}"
        rank_list.append(rank_holders)
    return rank_list

def perfect_score(student_info):
    """
    :param student_info: list of [<student name>, <score>] lists
    :return: First [<student name>, 100] found OR "No perfect score."
    """
    for students in student_info:
        if students[-1] == 100:
            return students
    return "No perfect score."
    
