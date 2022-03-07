# language: en

Feature: Check if the second ad from the second results page has at least one item bought

Scenario Outline: Search by iPhone and check it sales amount
    Given that I'm search by '<product>'
    When I go to '<page>'
    Then I check the '<product index>' and it has at '<least>' item bought
        Examples:
            | product     | page | product index | least |
            | iphone      | 2    | 2             | 1     |
            | galaxy note | 3    | 4             | 100   |
            | beats       | 5    | 5             | 99    |

