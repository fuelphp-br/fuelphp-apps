<?php
class Controller_Admin_Cliente extends Controller_Admin
{

	public function action_index()
	{
		$query = Model_Cliente::query();

		$pagination = Pagination::forge('clientes_pagination', array(
			'total_items' => $query->count(),
			'uri_segment' => 'page',
		));

		$data['clientes'] = $query->rows_offset($pagination->offset)
			->rows_limit($pagination->per_page)
			->get();

		$this->template->set_global('pagination', $pagination, false);

		$this->template->title   = "Clientes";
		$this->template->content = View::forge('admin/cliente/index', $data);
	}

	public function action_view($id = null)
	{
		$data['cliente'] = Model_Cliente::find($id);

		$this->template->title = "Cliente";
		$this->template->content = View::forge('admin/cliente/view', $data);

	}

	public function action_create()
	{
		if (Input::method() == 'POST')
		{
			$val = Model_Cliente::validate('create');

			if ($val->run())
			{
				$cliente = Model_Cliente::forge(array(
					'nome' => Input::post('nome'),
					'email' => Input::post('email'),
					'idade' => Input::post('idade'),
				));

				if ($cliente and $cliente->save())
				{
					Session::set_flash('success', e('Added cliente #'.$cliente->id.'.'));

					Response::redirect('admin/cliente');
				}

				else
				{
					Session::set_flash('error', e('Could not save cliente.'));
				}
			}
			else
			{
				Session::set_flash('error', $val->error());
			}
		}

		$this->template->title = "Clientes";
		$this->template->content = View::forge('admin/cliente/create');

	}

	public function action_edit($id = null)
	{
		$cliente = Model_Cliente::find($id);
		$val = Model_Cliente::validate('edit');

		if ($val->run())
		{
			$cliente->nome = Input::post('nome');
			$cliente->email = Input::post('email');
			$cliente->idade = Input::post('idade');

			if ($cliente->save())
			{
				Session::set_flash('success', e('Updated cliente #' . $id));

				Response::redirect('admin/cliente');
			}

			else
			{
				Session::set_flash('error', e('Could not update cliente #' . $id));
			}
		}

		else
		{
			if (Input::method() == 'POST')
			{
				$cliente->nome = $val->validated('nome');
				$cliente->email = $val->validated('email');
				$cliente->idade = $val->validated('idade');

				Session::set_flash('error', $val->error());
			}

			$this->template->set_global('cliente', $cliente, false);
		}

		$this->template->title = "Clientes";
		$this->template->content = View::forge('admin/cliente/edit');

	}

	public function action_delete($id = null)
	{
		if ($cliente = Model_Cliente::find($id))
		{
			$cliente->delete();

			Session::set_flash('success', e('Deleted cliente #'.$id));
		}

		else
		{
			Session::set_flash('error', e('Could not delete cliente #'.$id));
		}

		Response::redirect('admin/cliente');

	}

}
