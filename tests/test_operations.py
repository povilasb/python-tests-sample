from hamcrest import assert_that, is_, calling, raises

from algebra.operations import add, div


def describe_add():
    def describe_when_both_numbers_are_positive():
        def it_returns_their_sum():
            result = add(1, 2)

            assert_that(result, is_(3))

    def describe_when_second_argument_is_negative():
        def it_is_subtracted_from_the_first_argument():
            result = add(10, -5)

            assert_that(result, is_(5))

def describe_div():
    def describe_when_second_argument_is_0():
        def it_raises_zero_division_exception():
            assert_that(
                calling(div).with_args(10, 0),
                raises(ZeroDivisionError)
            )
