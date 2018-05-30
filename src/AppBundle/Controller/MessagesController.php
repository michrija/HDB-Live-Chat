<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Messages;
use AppBundle\Entity\User;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;


/**
 * Message controller.
 *
 * @Route("messages")
 */
class MessagesController extends Controller
{
    /**
     * Lists all message entities.
     *
     * @Route("/", name="messages_index")
     * @Method({"GET", "POST"})
     */
    public function indexAction(Request $request)
    {

        $em = $this->getDoctrine()->getManager();
        $user = $this->getUser();
        $message = new Messages();
        $form = $this->createForm('AppBundle\Form\MessagesType', $message);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {




            $em->persist($message);
            $em->flush();

            return $this->redirectToRoute('messages_index');
        }
        $em = $this->getDoctrine()->getManager();

        $messages = $em->getRepository('AppBundle:Messages')->findAll();


        return $this->render('messages/index.html.twig', array(
            'messages' => $messages,
            'form' => $form->createView(),
              'user'=>$user
        ));
    }


}
