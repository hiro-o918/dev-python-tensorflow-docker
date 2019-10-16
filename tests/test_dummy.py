import pytest

import tensorflow as tf


@pytest.fixture()
def a():
    a = tf.constant([1, 2])
    return a


@pytest.fixture()
def b():
    b = tf.constant([3, 4])
    return b


def test_add(a, b):
    actual = a + b
    expected = tf.Variable([4, 6])

    tf.assert_equal(actual, expected)
