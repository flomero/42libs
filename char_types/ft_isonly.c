/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isonly.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: flfische <flfische@student.42heilbronn.    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/06/07 11:16:45 by flfische          #+#    #+#             */
/*   Updated: 2024/06/07 11:18:06 by flfische         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/**
 * @brief checks if all characters in the string s pass the test in the func f
 * @param s string to check
 * @param f function to test each character
 * @return 1 if all characters in the string s pass the test, 0 if not
 */
int	ft_isonly(const char *s, int (*f)(int))
{
	while (*s)
	{
		if (!f(*s))
			return (0);
		s++;
	}
	return (1);
}
