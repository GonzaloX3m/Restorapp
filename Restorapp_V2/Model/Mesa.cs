namespace Restorapp_V2.Model
{
    public class Mesa
    {
        private int id;
        private bool dsponible;

        public int Id { get => id; set => id = value; }
        public bool Dsponible { get => dsponible; set => dsponible = value; }

        public override string ToString() => id.ToString();
    }
}