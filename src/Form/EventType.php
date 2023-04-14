<?php

namespace App\Form;

use App\Entity\Event;
use App\Entity\Type;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EventType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('date')
            ->add('descr')
            ->add('image')
            ->add('fk_type', EntityType::class, [
                'class' => Type::class,
                'choice_label' => 'type',
            ])         
            ->add('cap')
            ->add('location')
            ->add('email')
            ->add('phone')
            ->add('url')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Event::class,
        ]);
    }
}
