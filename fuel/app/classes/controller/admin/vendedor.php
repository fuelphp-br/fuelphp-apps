<?php
class Controller_Admin_Vendedor extends Controller_Admin
{

	public function action_index()
	{
		$query = Model_Vendedor::query();

		$pagination = Pagination::forge('vendedors_pagination', array(
			'total_items' => $query->count(),
			'uri_segment' => 'page',
		));

		$data['vendedors'] = $query->rows_offset($pagination->offset)
			->rows_limit($pagination->per_page)
			->get();

		$this->template->set_global('pagination', $pagination, false);

		$this->template->title   = "Vendedors";
		$this->template->content = View::forge('admin/vendedor/index', $data);
	}

	public function action_view($id = null)
	{
		$data['vendedor'] = Model_Vendedor::find($id);

		$this->template->title = "Vendedor";
		$this->template->content = View::forge('admin/vendedor/view', $data);

	}

	public function action_create()
	{
		if (Input::method() == 'POST')
		{
			$val = Model_Vendedor::validate('create');

			if ($val->run())
			{
				$vendedor = Model_Vendedor::forge(array(
					'nome' => Input::post('nome'),
					'email' => Input::post('email'),
					'cpf' => Input::post('cpf'),
				));

				if ($vendedor and $vendedor->save())
				{
					Session::set_flash('success', e('Added vendedor #'.$vendedor->id.'.'));

					Response::redirect('admin/vendedor');
				}

				else
				{
					Session::set_flash('error', e('Could not save vendedor.'));
				}
			}
			else
			{
				Session::set_flash('error', $val->error());
			}
		}

		$this->template->title = "Vendedors";
		$this->template->content = View::forge('admin/vendedor/create');

	}

	public function action_edit($id = null)
	{
		$vendedor = Model_Vendedor::find($id);
		$val = Model_Vendedor::validate('edit');

		if ($val->run())
		{
			$vendedor->nome = Input::post('nome');
			$vendedor->email = Input::post('email');
			$vendedor->cpf = Input::post('cpf');

			if ($vendedor->save())
			{
				Session::set_flash('success', e('Updated vendedor #' . $id));

				Response::redirect('admin/vendedor');
			}

			else
			{
				Session::set_flash('error', e('Could not update vendedor #' . $id));
			}
		}

		else
		{
			if (Input::method() == 'POST')
			{
				$vendedor->nome = $val->validated('nome');
				$vendedor->email = $val->validated('email');
				$vendedor->cpf = $val->validated('cpf');

				Session::set_flash('error', $val->error());
			}

			$this->template->set_global('vendedor', $vendedor, false);
		}

		$this->template->title = "Vendedors";
		$this->template->content = View::forge('admin/vendedor/edit');

	}

	public function action_delete($id = null)
	{
		if ($vendedor = Model_Vendedor::find($id))
		{
			$vendedor->delete();

			Session::set_flash('success', e('Deleted vendedor #'.$id));
		}

		else
		{
			Session::set_flash('error', e('Could not delete vendedor #'.$id));
		}

		Response::redirect('admin/vendedor');

	}

}
