<?php echo Form::open(); ?>
	<fieldset>
		<div class="form-group">
			<?php echo Form::label('Nome', 'nome', array('class' => 'control-label')); ?>

			<?php echo Form::input('nome', Input::post('nome', isset($cliente) ? $cliente->nome : ''), array('class' => 'form-control', 'placeholder' => 'Nome')); ?>
		</div>

		<div class="form-group">
			<?php echo Form::label('Email', 'email', array('class' => 'control-label')); ?>

			<?php echo Form::input('email', Input::post('email', isset($cliente) ? $cliente->email : ''), array('class' => 'form-control', 'placeholder' => 'Email')); ?>
		</div>

		<div class="form-group">
			<?php echo Form::label('Idade', 'idade', array('class' => 'control-label')); ?>

			<?php echo Form::input('idade', Input::post('idade', isset($cliente) ? $cliente->idade : ''), array('class' => 'form-control', 'placeholder' => 'Idade')); ?>
		</div>

		<div class="form-group">
			<?php echo Form::submit('submit', 'Save', array('class' => 'btn btn-primary')); ?>

			<div class="pull-right">
				<?php if (Uri::segment(3) === 'edit'): ?>
					<div class="btn-group">
						<?php echo Html::anchor('admin/cliente/view/'.$cliente->id, 'View', array('class' => 'btn btn-info')); ?>
						<?php echo Html::anchor('admin/cliente', 'Back', array('class' => 'btn btn-default')); ?>
					</div>
				<?php else: ?>
					<?php echo Html::anchor('admin/cliente', 'Back', array('class' => 'btn btn-link')); ?>
				<?php endif ?>
			</div>
		</div>
	</fieldset>


<?php echo Form::close(); ?>