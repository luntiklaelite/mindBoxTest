using MindBox.Geometry.GeometryObjects;
using System;
using Xunit;

namespace MindBox.Geometry.Tests
{
    public class CircleTests
    {
        [Theory]
        [InlineData(5, 78.5398, 4)]
        [InlineData(1, 3.14159265, 8)]
        [InlineData(2.4, 18.096, 3)]
        public void GetArea_Success(double radius, double exceptedArea, int roundTo)
        {
            IGeometry geometry = new Circle() { Radius = radius };

            var result = Math.Round(geometry.GetArea(), roundTo);

            Assert.Equal(result, exceptedArea);
        }

        [Theory]
        [InlineData(-1)]
        [InlineData(-512311212)]
        public void CreateCircle_NegativeRadius_ThrowsExceptions(double radius)
        {
            Assert.Throws<ArgumentOutOfRangeException>(
                () => new Circle() { Radius = radius });
        }
    }
}
