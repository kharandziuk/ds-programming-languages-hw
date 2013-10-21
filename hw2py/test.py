import unittest

import hw

class SubstitutionTest(unittest.TestCase):

    def test_task1(self):
        self.assertItemsEqual(
            hw.all_except_option('string', ['string']),
            []
        )
        self.assertItemsEqual(
            hw.all_except_option('string', ['string', 'string']),
            []
        )
        self.assertIsNone(
            hw.all_except_option('string', ['some'])
        )
        self.assertItemsEqual(
            hw.all_except_option('string', ['string', 'some']),
            ['some']
        )

    def test_task2(self):
        self.assertItemsEqual(
            hw.get_substitutions([["foo"],["there"]], "foo"),
            []
        ) 
        self.assertItemsEqual(
            hw.get_substitutions(
                [["foo", "bar"],["there", "elsewere"]], "foo"
            ),
            ["bar"]
        )
        self.assertItemsEqual(
            hw.get_substitutions(
                [["foo", "bar", "jap"] ], "foo"
            ),
            ["bar", "jap"]
        )
        self.assertItemsEqual(
            hw.get_substitutions(
                [
                    ["Fred","Fredrick"],
                    ["Elizabeth","Betty"],
                    ["Freddie", "Fred","F"]
                ], "Fred"
            ),
            ["Fredrick","Freddie","F"]
        )

    def test_task3_1(self):
        actual = hw.similar_names(
            [
                ["Fred","Fredrick"],
                ["Elizabeth","Betty"],
                ["Freddie","Fred","F"]
            ], 
            {'first': "Fred", 'middle': "W", 'last': "Smith"}
        )
        expected = [
            {'first': "Fred", 'last': "Smith", 'middle': "W"},
            {'first': "Fredrick", 'last': "Smith", 'middle': "W"},
            {'first': "Freddie", 'last': "Smith", 'middle': "W"},
            {'first': "F", 'last': "Smith", 'middle': "W"}
        ]
        self.assertItemsEqual(actual, expected)

    def test_task3_1(self):
        actual = hw.similar_names(
            [], 
            {'first': "Fred", 'middle': "W", 'last': "Smith"}
        )
        expected = [
            {'first': "Fred", 'last': "Smith", 'middle': "W"},
        ]
        self.assertItemsEqual(actual, expected)


class SolitaireTestCase(unittest.TestCase):

    def test_card_color(self):
        self.assertEqual(hw.card_color((hw.SPADES, 2)), hw.BLACK)
        self.assertEqual(hw.card_color((hw.HEARTS, 2)), hw.RED)

    def test_card_value(self):
        self.assertEqual(hw.card_value((hw.SPADES, 2)), 2)
        self.assertEqual(hw.card_value((hw.HEARTS, hw.ACE)), 11)





if __name__ == '__main__':
    unittest.main()
