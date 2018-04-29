using Leap;
using System;
using System.Threading;

class Sample
{
    public static void Main()
    {
        Controller controller = new Controller();
        SampleListener listener = new SampleListener();
        controller.Connect += listener.OnServiceConnect;
        controller.Device += listener.OnConnect;
        controller.FrameReady += listener.OnFrame;

        // Keep this process running until Enter is pressed
        Console.WriteLine("Press Enter to quit...");
        Console.ReadLine();
    }
}

class SampleListener
{
    public void OnServiceConnect(object sender, ConnectionEventArgs args)
    {
        Console.WriteLine("Service Connected");
    }

    public void OnConnect(object sender, DeviceEventArgs args)
    {
        Console.WriteLine("Leap Motion Connected");
    }

    public void OnFrame(object sender, FrameEventArgs args)
    {
        Frame frame = args.frame;

        foreach (Hand hand in frame.Hands)
        {
            Console.WriteLine(hand.PalmPosition);
        }
    }
}