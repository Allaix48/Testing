﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Drawing;

namespace lab3_console
{
    class Program
    {

        private static bool IsYearVis(int year)
        {
            if (year % 4 == 0 && year % 100 != 0)
                return true;
            if (year % 4 == 0 && year % 400 == 0)
                return true;
            return false;
        }
        //Task 2
        private static double f(double x)
        { 
            return x+ Math.Sin(x);
        }

        private static double Binary_Search(double l, double r, double eps = 1e-9)
        {
            if (r <= l)
                throw new Exception("Правая граница интервала должна быть больше левой");

            if((r - l) <= eps) 
               throw new Exception("Ширина интервала должна быть строго больше точности");

            if (eps <=0)
                throw new Exception("Точность должна быть положительным значением");

            if (f(r) * f(l) > 0)
            {
                throw new Exception("Интервал не содержит корней монотонной функции");
            }
            double m;
          
            if (f(l) == 0)
                return f(l);
            if (f(r) == 0)
                return f(r);


            do
            {
                m = (l + r) * 0.5;
                if (f(m) < 0)
                    l = m;
                else 
                        r = m;
            } while ((r - l) > eps);
            return m;
        }

        // Task 3
        public class Rect
        {

            public int lx = 0;
            public int ly = 0;
            public int rx = 0;
            public int ry = 0;

            public string toString()
            {
                return lx.ToString() + " " + " " + ly.ToString() + " " + rx.ToString() + " " + ry.ToString();
            }
            public Rect(int lx, int ly, int rx, int ry)
            {
                this.lx = lx;
                this.ly = ly;
                this.rx = rx;
                this.ry = ry;
            }
            public Rectangle GetRectangle()
            {
                Rectangle rectangle = new Rectangle(lx, ly, Math.Abs( rx-lx),Math.Abs( ly-ry));
                return rectangle;
            }
        }
        private static Rectangle? AreRectCross(Rect A, Rect B)
        {
            //var rA = A.GetRectangle();
            //var rB = B.GetRectangle();
            //var rS = Rectangle.Intersect(rA, rB);


            Rectangle r1 = A.GetRectangle();
            Rectangle r2 = B.GetRectangle();
            Rectangle? intersectionRect = null;

            int leftX = Math.Max(r1.X, r2.X);
            int rightX = Math.Min(r1.X + r1.Width, r2.X + r2.Width);
            int topY = Math.Min(r1.Y, r2.Y);
            int bottomY = Math.Max(r1.Y - r1.Height, r2.Y - r2.Height);

            if (leftX <= rightX && topY >= bottomY)
            {
                intersectionRect = new Rectangle(leftX, topY, rightX - leftX, topY -bottomY  );
            }
            else
            {
                // Rectangles do not overlap, or overlap has an area of zero (edge/corner overlap)
            }


            return intersectionRect;
        }


        static void Main()
        {
            StreamReader sr = null;
            try
            {
                 sr = new StreamReader("Input.txt");
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception: " + e.Message);
                return;
            }

            int op=0;
            
            string answer = "";
            var test_function = Convert.ToInt32(sr.ReadLine());
            while (!sr.EndOfStream)
            {
                List<string> args = new List<string>();
                var line = sr.ReadLine();
                if (line[0] == '#') { 
                    op = Convert.ToInt32(line[1]) - 48;
                    Console.WriteLine("Task"+op.ToString()+":");
                    continue; }
                var args_str = line.Split((' '));
               
                if (test_function != 0 && op != test_function) continue;
                try
                {
                    switch (op)
                    {
                        case 1:
                            var year = Convert.ToInt32(args_str[0]);
                            answer = IsYearVis(year) ? "Yes" : "No";                          
                            break;
                        case 2:
                           
                            var a = Convert.ToDouble(args_str[0]);
                            var b = Convert.ToDouble(args_str[1]);
                            var eps = Convert.ToDouble(args_str[2]);
                            var root = Binary_Search(a, b, eps);

                            int tmp = Convert.ToInt32(  Math.Round( 1 / eps));
                            
                            var format = "{0:f"+(tmp.ToString()).Length.ToString()+"}";
                            answer = String.Format(format, root);

                            break;
                        case 3:
                            var A = new Rect(
                                 Convert.ToInt32(args_str[0]),
                                 Convert.ToInt32(args_str[1]),
                                 Convert.ToInt32(args_str[2]),
                                 Convert.ToInt32(args_str[3])
                                
                                );
                            var B = new Rect(
                                 Convert.ToInt32(args_str[4]),
                                  Convert.ToInt32(args_str[5]),
                                  Convert.ToInt32(args_str[6]),
                                  Convert.ToInt32(args_str[7])
                                
                                 );

                            Rectangle? res = AreRectCross(A, B);
                            if (res == null) 
                                answer = "Not Cross";
                            else 
                                answer = res.ToString();
                            break;
                        default:
                            throw new Exception("AAA");
                    }
                    Console.WriteLine("[" + line + "]: " + answer);



                }
              
                  catch (Exception e)
                {
                    Console.WriteLine("[" + line + "]: Error - " + e.Message);
                }

               
            }
            sr.Close();
            Console.ReadLine();

        }

       
    }
}
