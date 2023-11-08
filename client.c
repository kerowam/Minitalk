/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gfredes- <gfredes-@student.42malaga.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/08 18:13:19 by gfredes-          #+#    #+#             */
/*   Updated: 2023/11/08 19:58:52 by gfredes-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

int	main(int argc, char **argv)
{
	int	pid;
	int	i;

	if (argc != 3)
	{
		ft_putstr_fd("Something goes wrong!\n", 1);
		ft_putstr_fd("Indications of the program: ./client <PID> <String>", 1);
		return (1);
	}
	pid = ft_atoi(argv[1]);
	if (!ft_isdigit(pid))
	{
		ft_putstr_fd("Wrong PID! It have to be a number.\n", 1);
		return (2);
	}
	i = 0;
	while (argv[2][i] != '\0')
	{
		ft_sending_bits(pid, argv[2][i]);
		i++;
	}
	ft_sending_bits(pid, '\n');
	return (0);
}
