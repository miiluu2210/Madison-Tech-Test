def find_missing(numbers: list[int]) -> list[int]:
    """
    This function takes a list of integers and returns a list of missing integers in the range from the minimum to the maximum value of the input list.

    :param numbers: List of integers
    :return: List of missing integers
    """
    if not numbers:
        return []

    missing = []

    for num in range(1, N + 1):
        if num not in numbers:
            missing.append(num)

    return missing