using MindBox.Geometry.GeometryObjects;
using System;
using Xunit;

namespace MindBox.Geometry.Tests
{
    public class TriangleTests
    {
        [Theory]
        [InlineData(1, 1, 1, 0.433, 3)]
        [InlineData(7, 5, 3, 6.495, 3)]
        [InlineData(25, 13, 33, 144.8005, 4)]
        public void GetArea_Success(double a, double b, double c, double exceptedArea, int roundTo)
        {
            IGeometry geometry = new Triangle(a, b, c);

            var result = Math.Round(geometry.GetArea(), roundTo);

            Assert.Equal(result, exceptedArea);
        }

        [Theory]
        [InlineData(3, 1, 1)]
        [InlineData(1, 3, 1)]
        [InlineData(1, 1, 3)]
        public void CreateTriangle_LongSide_ThrowsExceptions(double a, double b, double c)
        {
            Assert.Throws<ArgumentException>(() => new Triangle(a, b, c));
        }

        [Theory]
        [InlineData(-1, 1, 1)]
        [InlineData(1, -1, 1)]
        [InlineData(1, 1, -1)]
        public void CreateTriangle_NegativeSide_ThrowsExceptions(double a, double b, double c)
        {
            Assert.Throws<ArgumentOutOfRangeException>(() => new Triangle(a, b, c));
        }

        [Theory]
        [InlineData(3, 4, 5, true)]
        [InlineData(5, 3, 4, true)]
        [InlineData(4, 5, 3, true)]
        [InlineData(6, 8, 10, true)]
        [InlineData(3, 4, 3, false)]
        public void IsStraight_Success(double a, double b, double c, bool isStraightExcepted)
        {
            var triangle = new Triangle(a, b, c);

            var result = triangle.IsStraight;

            Assert.Equal(result, isStraightExcepted);
        }
    }
}
