/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gfredes- <gfredes-@student.42malaga.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/08 15:08:12 by gfredes-          #+#    #+#             */
/*   Updated: 2023/11/08 20:35:24 by gfredes-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	ft_sig_handler(int signal)
{
	static int	bit;
	static int	c;

	if (signal == SIGUSR1)
		c |= (0x01 << bit);
	bit++;
	if (bit == 8)
	{
		ft_putchar_fd(c, 1);
		bit = 0;
		c = 0;
	}
}

int	main(void)
{
	ft_putstr_fd("PID: ", 1);
	ft_putnbr_fd(getpid(), 1);
	ft_putstr_fd("\n", 1);
	while (1)
	{
		signal(SIGUSR1, ft_sig_handler);
		signal(SIGUSR2, ft_sig_handler);
		pause();
	}
	return (0);
}
